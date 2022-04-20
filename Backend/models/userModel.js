/* eslint-disable prettier/prettier */
const crypto = require('crypto');
const mongoose = require('mongoose');
const validator = require('validator');
const bcrypt = require('bcryptjs');

const userSchema = new mongoose.Schema({
  firstName: {
    type: 'string',
    required: [true, 'Please enter your first name'],
  },
  lastName: {
    type: 'string',
    required: [true, 'Please enter your last name'],
  },
  email: {
    type: 'string',
    required: [true, 'Please provide your email'],
    unique: true,
    lowercase: true,
    validate: [validator.isEmail, 'please provide a valid email'],
  },
  role: {
    type: 'string',
    default: 'user',
  },
  password: {
    type: 'string',
    required: [true, 'Please provide a password'],
    minlength: [8, 'password must be at least 8 characters'],
    select: false,
  },
  passwordConfirm: {
    type: 'string',
    // required: [true, 'Please confirm your password'],
    // This only works "SAVE"
    validate: {
      validator: function (el) {
        return el === this.password;
      },
      message: 'passwords are not the same',
    },
  },
  passwordResetToken: 'string',
  passwordResetExpires: Date,
  active: {
    type: 'boolean',
    default: true,
    select: false,
  },
  bank: {
    type: Number,
    default: 100.0,
  },
});

userSchema.pre('save', async function (next) {
  // Only works if the password is actually changed
  if (!this.isModified('password')) return next();
  // hash the password with the cost of 12
  this.password = await bcrypt.hash(this.password, 12);
  // remove passwordConfirm from DB
  this.passwordConfirm = undefined;
  next();
});

userSchema.pre(/^find/, function (next) {
  this.find({ active: { $ne: false } });
  next();
});

userSchema.methods.correctPassword = async function (
  candidatePassword,
  userPassword
) {
  return await bcrypt.compare(candidatePassword, userPassword);
};

userSchema.methods.createPasswordResetToke = function () {
  const resetToken = crypto.randomBytes(32).toString('hex');

  this.passwordResetToken = crypto
    .createHash('sha256')
    .update(resetToken)
    .digest('hex');
  // console.log({ resetToken }, this.passwordResetToken);
  this.passwordResetExpires = Date.now() + 10 * 60 * 60 * 1000;
  return resetToken;
};

const User = mongoose.model('User', userSchema);
module.exports = User;

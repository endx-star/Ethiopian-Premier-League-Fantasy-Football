// /* eslint-disable prettier/prettier */
// const nodemailer = require('nodemailer');
// const pug = require('pug');
// const htmlToText = require('html-to-text');

// module.exports = class Email {
//   constructor(user, url) {
//     this.to = user.email;
//     this.firstName = user.name.split(' ')[0];
//     this.url = url;
//     this.from = `Fantasy Football <${process.env.EMAIL_FROM}>`;
//   }

//   newTransport() {
//     if(process.env.NODE_ENV === 'production') {
//       //Sendgrid
//       return 1;
//     }
//     return nodemailer.createTransport({
//       host: process.env.EMAIL_HOST,
//       port: process.env.EMAIL_PORT,
//       auth: {
//         user: process.env.EMAIL_USERNAME,
//         pass: process.env.EMAIL_PASSWORD,
//       },
//     });
//     send(template, subject) {
//      // 1 Render HTML based on a pug template
//       const html = pug.renderFile(`${_dirname}/../views/emails/${template}.pug`, {
//         url: this.url,
//         subject
//   })
//       //2 Define email options_
//    const mailOptions = {
//     from: this.from,
//     to: this.to,
//      subject: subject,
//     html,
//     text: htmlToText.fromString(html),
//     // html
//   };
//       3)// Create a transport and send email
//       await this.newTransport().sendMail(mailOptions);
//     };
//     sendFixture(){
//      await this.send('Fantasy Ethiopia', 'Do not miss the derby game this week on saturday at 10AM between St. George and Ethiopia Buna')
//     };
// };

// // module.exports = sendEmail;

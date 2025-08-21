## Ethiopian Premier League Fantasy Football (EPLFF)

A full‑stack fantasy football platform for the Ethiopian Premier League.

- **Backend**: Node.js, Express, MongoDB (Mongoose), JWT auth, Nodemailer, security middlewares
- **Frontend (Mobile/Web)**: Flutter

### Table of Contents
- [Features](#features)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Backend Setup](#backend-setup)
  - [Frontend Setup](#frontend-setup)
- [Environment Variables](#environment-variables)
- [Running the Apps](#running-the-apps)
- [Seeding Data](#seeding-data)
- [Project Structure](#project-structure)
- [API Overview](#api-overview)
- [Build and Release](#build-and-release)
- [Troubleshooting](#troubleshooting)
- [License](#license)

### Features
- User authentication (JWT), rate limiting, security hardening (Helmet, XSS, Mongo sanitize)
- Teams, players, clubs, fixtures, highlights endpoints
- Flutter client with multiple screens: login/signup, points, pick team, transfers, leagues, etc.

### Architecture
```
Ethiopian-Premier-League-Fantasy-Football/
├─ Backend/            # Express REST API + MongoDB
└─ frontend/
   ├─ Client/          # Flutter application (Android / iOS / Web)
   └─ Admin/           # Admin console (Pug views + static assets)
```

### Getting Started

#### Prerequisites
- Node.js 14+ (Backend) and npm
- Flutter SDK and Dart (for mobile/web client)
- MongoDB Atlas account or local MongoDB instance

#### Backend Setup
1) Copy `Backend/config.env` template and set secrets locally (never commit secrets):
```
NODE_ENV=development
PORT=3000
USERNAME=<username>
DATABASE=mongodb+srv://<user>:<PASSWORD>@cluster0.cecft.mongodb.net/fantasy-football?retryWrites=true&w=majority
DATABASE_LOCAL=mongodb://localhost:27017/fantasy-football
DATABASE_PASSWORD=<db_password>
JWT_SECRET=<jwt_secret>
JWT_EXPIRES_IN=90d
JWT_COOKIE_EXPIRES_IN=90
EMAIL_USERNAME=<smtp_user>
EMAIL_PASSWORD=<smtp_pass>
EMAIL_HOST=<smtp_host>
EMAIL_PORT=<smtp_port>
EMAIL_FROM=<from_email>
```
2) Install dependencies:
```
cd Backend
npm install
```
3) Run the API (development):
```
npm start
```
The server runs on `http://localhost:3000` by default (see `PORT`).

#### Frontend Setup
1) Install Flutter dependencies:
```
cd frontend/Client
flutter pub get
```
2) Run on a device or emulator:
```
flutter run
```
3) Run for web:
```
flutter run -d chrome
```

### Environment Variables
- Backend expects variables as shown in `Backend/config.env` (do not commit real secrets). Ensure you have set `DATABASE` and `DATABASE_PASSWORD` properly if using Atlas, or set `DATABASE_LOCAL` and connect locally.
- Flutter client may need API base URL configuration in your services layer. The current client constructs absolute URLs; ensure you pass full URLs including protocol.

### Running the Apps
- Backend (dev): `cd Backend && npm start`
- Backend (prod-like): `npm run start:prod`
- Frontend: `cd frontend/Client && flutter run`

### Seeding Data
There is a helper script at `Backend/dev-data/data/import-dev-data.js` for importing/deleting seed data. Example usage:
```
cd Backend/dev-data/data
node import-dev-data.js --import   # import users from user.json
node import-dev-data.js --delete   # delete all users
```
Additional datasets (`players.json`, `clubs.json`, `fixture.json`, `highlights.json`) are scaffolded in the same folder; the corresponding code is present but commented. You can enable them as needed.

### Project Structure
```
Backend/
  app.js                 # Express app, routes, middleware
  server.js              # Bootstrap and DB connection
  controllers/           # Controllers for resources
  routes/                # Express routers (players, users, clubs, teams, ...)
  models/                # Mongoose models
  utils/                 # Errors, features, email, etc.
  dev-data/data/         # Seed scripts and JSON fixtures
  public/                # Static assets (e.g., images)

frontend/
  Client/
    lib/                 # Flutter app code (screens, backend calls)
    android/, ios/, web/ # Platform folders
    asset/               # Images and fonts
    pubspec.yaml         # Flutter dependencies
  Admin/
    views/               # Pug templates (admin pages)
    public/              # Static assets (css, js, images)
```

### Admin Console
- The admin UI lives in `frontend/Admin` and uses Pug templates with static assets in `public`.
- To serve these pages via the backend, configure Express to use Pug and point `views` to `frontend/Admin/views`, and serve static assets from `frontend/Admin/public`. Example routes can render templates like `res.render('index')`.
- Alternatively, host the `public` assets behind any static server and render Pug via a small Node app.

### API Overview
Base URL: `http://localhost:<PORT>/api/v1`

Key routes (see `Backend/routes/*`):
- `GET /players`, `POST /players`, etc.
- `GET /users`, auth routes in `authController`
- `GET /clubs`, `GET /teams`, `GET /fixtures`, `GET /highlights`

Security middleware: Helmet, rate limiting, XSS clean, mongo sanitize.

### Build and Release
- Backend: standard Node deployment (set `NODE_ENV=production`, configure env vars). Use a process manager (PM2) or containerize.
- Flutter:
  - Android: `flutter build apk` or `flutter build appbundle`
  - iOS: `flutter build ios` (requires Xcode/macOS)
  - Web: `flutter build web`

### Troubleshooting
- MongoDB connection issues: verify `DATABASE` URI and `DATABASE_PASSWORD`.
- CORS/API base URL in Flutter: ensure full absolute URLs with protocol and reachable host/port.
- Flutter build errors: run `flutter clean && flutter pub get`.

### License
ISC License © Endale Tegegnework.

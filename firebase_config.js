// firebase_config.js
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyCHU85bR2xbpy0dd_fFsGSJvp-n176ZqmI",
  authDomain: "task-manager-7859f.firebaseapp.com",
  projectId: "task-manager-7859f",
  storageBucket: "task-manager-7859f.appspot.com",
  messagingSenderId: "976485051426",
  appId: "1:976485051426:web:afe611886f9dc20d99ee7b",
  measurementId: "G-NDJPZNKM8K"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);
const firestore = getFirestore(app);

export { app, analytics, auth, firestore };

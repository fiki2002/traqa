///BASE URL
const String _baseUrl = 'https://server-api-staging.up.railway.app';

/// AUTH
const String _auth = '$_baseUrl/auth';

const String signUpEndpoint = '$_auth/signup';
const String signInEndpoint = '$_auth/login';
const String resendEmailCode = '$_auth/resend-email-code';
const String verifyEmailUrl = '$_auth/verify-email';
const String forgotPasswordUrl = '$_auth/forgot-password';
const String resetPasswordUrl = '$_auth/reset-password';
const String currentUserUrl = '$_auth/current-user';

//!   ---- PROFILE ----- !\\

const String updateUserLocationUrl = '$_baseUrl/user/profile';
const String updateUserProfileDetails = '$_baseUrl/user/profile';

//! USER  DASHBOARD

const String _userDashboard = '$_baseUrl/user-dashboard';
const String nearbyVendorsUrl = '$_userDashboard/nearby-vendors';
const String topFoodPickUrl = '$_userDashboard/top-foods';
const String getVendorDetailsUrl = '$_userDashboard/vendor';
const String singleMenuDetails = '$_userDashboard/menu';
const String filterContentUrl = '$_userDashboard/search';

//! VENDOR

const String _vendor = '$_baseUrl/vendor/';
const String createVendorProfileUrl = '$_vendor/profile';


//!  DIGITAL OCEAN

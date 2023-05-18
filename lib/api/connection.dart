
class API{

static const hostConnection = "http://localhost/api_corpus"; 
static const hostConnectionuser = "$hostConnection/user"; 


//signUp/login/forgetpassword user
static const validateEmail = "$hostConnectionuser/validateemail.php";
static const signUp = "$hostConnectionuser/signup.php ";
static const login = "$hostConnectionuser/connectionuser.php ";
static const ckeck = "$hostConnectionuser/check.php";


//insert/udate/detele/getall -->Alimentation

  static const hostapi = "http://localhost/api_corpus"; 
  static const hostapicrud = "$hostapi/crud";
  static const addArtiste = "$hostapicrud /insert.php ";
 static const getArtiste = "$hostapicrud /getall.php ";
  static const upArtiste = "$hostapicrud /update.php";
 static const deArtiste = "$hostapicrud /delete.php";
 
 //ajouter media

  //  static const BASE_URL="http://localhost/api_corpus/media/";
   static const hostapimedia = "$hostapi/media";
   static const savemedia = "$hostapimedia/up.php"; 

  //ajouter corpus
  
  //  static const URL="http://localhost/api_corpus/corpus/";
   static const hostapicorpus = "$hostapi/corpus/";
  static const add = "$hostapicorpus/ajouter.php ";
}













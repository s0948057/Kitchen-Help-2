# Kitchen-Help
Kitchen Help App
Known Issues:
  There may be an issue with the google sign in plist and github. For some reason its getting confused with the wrong googleplist url. 
  This is the correct url that should be used:  
    com.googleusercontent.apps.45004045845-urpnv2nduqb34vbeah70cl3ee6d0rk9f
   One with a 6 at the end of it may be showing as an error, that is an incorrect firebase database/ auth that its looking to. 
   Replace it with the correct one by double clicking the class name, going to the info tab and copying and pasting the correct url in there
   If the correct url is in there, go and copy paste the error one and place that one in the code. Repeat the same process for the
   googleplist file. Run the program and wait until the error code shows the correct url. Then replace that url in the spots above.

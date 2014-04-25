# Executive Contact List app for BlackBerry 10, and [Secure Work Space](http://us.blackberry.com/content/dam/blackBerry/pdf/business/english/bes10/BES10-2-SWS-EMM-data-sheet.pdf) (iOS and Android)

This cross platform app makes it easy to view a contact list for a group of people. It is designed to work with BlackBerry 10 or iOS and Android under Secure Work Space. It contains both a server side component as well as the mobile app. The server component can be modified to work with in any enviroment which can return JSON. A sample server component has been included. 

The sample code for this application is Open Source under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).


**Author** 

* [Shikhir Singh](http://code.shikhir.com/)


**Release History**

* **v1.0.0** - Initial Release

**Tools**

* Sencha Architect 3.0+ (Optional)
* Sencha Touch 2.3.1+ (Required)
* Xcode (Optional)
* Android SDK (Optional)
* BlackBerry 10 NDK - Momentics (Optional)
* Cordova 3.4 or WebWorks 2.0+ (Required)

** Install Instructions **

***Assumptions Prior to Build:*** 

1. Cordova or WebWorks is already installed. 
2. Appropriate SDKs have been installed for the intended device platform (for example: Xcode for iOS, Momentics for BlackBerry 10, and Android SDKs for Android.)
3. Signing keys have been created and registered as appropriate

***Server Install Instructions***

1. Copy the contents of the server folder into a php server within your company's firewall
2. Replace the contents of the ecl.json file with the desired data

***Preparation prior to building with Cordova***

1. Download [Sencha Touch](http://www.sencha.com/products/touch) 2.3.1+ and copy the unziped contents into a new folder called "touch" and place the new folder in the following folder client/SA_3/ 
2. Open the client project located in /client/SA_3 with Sencha Architect 3 and change the library to the "touch" folder located by going to the settings in the Project Inspector in the Resource>Library>Libary Base Path
3. Change the "Publish Path" located under the Build Settings
4. Press the "Build web app" button
5. Go to the path of the published folder and change the index.html to include cordova.js and then [package the app using cordova](http://cordova.apache.org/docs/en/3.4.0/)
```
<script src="cordova.js"></script>
```

***Cordova Hints***

* A sample config.xml file is provided in the client/SA_3/ folder. Depending on the cordova version you are using, you may need to move it
* Numerous icons for the app have been provided in the client/SA_3/icons folder
* Sample Splash Screen has been provided in client/SA_3/startup folder. Image used for splash screen is available [here](http://openclipart.org/detail/168821/gente-de-negocios-business-people-by-asrafil). Icon image is available [here](http://openclipart.org/detail/5578/business-person-by-msewtz)
* [Sencha Cmd](http://www.sencha.com/products/sencha-cmd/) can be used to build iOS and Android apps as an alternative to Cordova, even on a PC! This method is untested for this app but should work. 

***Secure Work Space Deployment***
If deploying for SWS for iOS/Android, follow the instructions for (SWS Deployment)[http://developer.blackberry.com/devzone/develop/enterprise/install_android_or_ios_work_space_app.html] for iOS and Android

** Modifying the Source **
Although the source can be modified using any text editor, [Sencha Architect 3](http://www.sencha.com/products/architect/) is recommended. Note: once the code is modfied using an editor other than Sencha Architect, chances are good it can no longer be imported into Sencha Architect. 

** But I don't want to build the app! **
A prepackaged app has been placed in the /build/ folder for testing purposes only. But note, the server url has been hardcoded.

**Tested on**

1. BlackBerry Z30
2. BlackBerry Z10
3. BlackBerry Q10
4. iPad Mini - First Generation
5. iPad Air - First Generation
6. iPhone 4S
7. iPhone 5S
8. Samsung Galaxy S4
9. Nexus 7

**License**

Apache License - See License.txt for more information 

**Known Issues**
As of this writing, Cordova does not currently have a uniform way to identify the icons and splashscreen across all the platforms. As a result, the provided config.xml contains the tag <icon src="..."> which will need to be removed before building for iOS and Android


## Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING 
BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE 
AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR 
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
OTHER DEALINGS IN THE SOFTWARE.

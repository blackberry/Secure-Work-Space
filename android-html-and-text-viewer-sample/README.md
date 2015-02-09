# Sample Android SWS HTML and Text File Viewer

This sample serves as a viewer for HTML and plaintext files from the Secure Workspace for Android devices. It can also intercept URL's and open the page using the app's viewer instead of the default browser.

The sample code for this application is Open Source under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).

**Applies To**

* [BlackBerry 10 WebWorks SDK](https://developer.blackberry.com/html5/download/sdk) 
* [Apache Cordova for BlackBerry 10](https://github.com/blackberry/cordova-blackberry/tree/master/blackberry10) 

**Author(s)** 

* [Russell Borja]



**Dependencies**

1. [cordova-webintent plugin](https://github.com/Initsogar/cordova-webintent) is [licensed](https://github.com/Initsogar/cordova-webintent/blob/master/README.md) under the MIT license.


**Contributing**

* To contribute code to this repository you must be [signed up as an official contributor](http://blackberry.github.com/howToContribute.html).


## Required Plugins ##

####The following plugins are required for this sample:####

	https://github.com/Initsogar/cordova-webintent.git

## How to Build

1. Clone this repo to your local machine.

2. Ensure the [BlackBerry 10 WebWorks SDK 2.0](https://developer.blackberry.com/html5/download/sdk) is correctly installed.

3. Open a command prompt (windows) or terminal (mac) and run the following commands:

	```
	webworks create <your source folder>\HTMLViewer com.example.androidtest HTMLViewer
	```

4. Navigate to the HTMLViewer folder and run the following commands in the command prompt (windows) or terminal (mac)

	```
	cordova platform add android
	cordova plugin add https://github.com/Initsogar/cordova-webintent.git
	```

5. **Replace** the default HTMLViewer\www folder with the \www folder from **this** project

6. **Replace** the default HTMLViewer\config.xml with the config.xml from **this** project

7. Navigate to <your source folder>\HTMLViewer\platforms\android and **replace** the AndroidManifest.xml with the HTMLViewer\AndroidManifest.xml from **this** project

8. From the command prompt (Windows) or terminal (mac), navigate to the HTMLViewer folder

	```
	cd <your source folder>\HTMLViewer
	```

9. Run the following command to build and deploy the app to an Android device connected via USB

	```
	cordova run android
	```

## More Info

* [BlackBerry HTML5 WebWorks](https://bdsc.webapps.blackberry.com/html5/) - Downloads, Getting Started guides, samples, code signing keys.
* [BlackBerry WebWorks Development Guides](https://bdsc.webapps.blackberry.com/html5/documentation)
* [BlackBerry WebWorks Community Forums](http://supportforums.blackberry.com/t5/Web-and-WebWorks-Development/bd-p/browser_dev)
* [BlackBerry Open Source WebWorks Contributions Forums](http://supportforums.blackberry.com/t5/BlackBerry-WebWorks/bd-p/ww_con)

## Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

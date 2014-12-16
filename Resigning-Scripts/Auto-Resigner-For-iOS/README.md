# SWS Auto-Resigner Script

The purpose of this script is to simplify the resigning of an iOS Secure Work Space app. Apps need to be re-signed after they are [wrapped](http://devblog.blackberry.com/2014/12/secure-work-space-enterprise-and-partner-wrapping/) with BES 10+. Wrapping an app invalidates it's previous signature. The manual process for wrapping an app is documented on [developer.blackberry.com](http://developer.blackberry.com/devzone/develop/enterprise/install_android_or_ios_work_space_app.html) and the [BES Universal Device Service Documentation](http://docs.blackberry.com/en/admin/deliverables/62506/BES10_v10.2.1_UDS_Advanced_Admin_Guide_en.pdf)


The sample code for this application is Open Source under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).


**Author**

* [Shikhir Singh](http://code.shikhir.com/)


**Version**

* **V1.0.2** - Updated for bug fixes


**Dependencies**

* OSX
* Xcode Command Line Tools
* BES Wrapped iOS App(the .ipa file)
* [iOS Enterprise Signing Keys](https://developer.apple.com/programs/ios/enterprise/)


**How to re-sign a wrapped app using this script**

1. Set Environment Variable SWSSIGNIDENTITY to the iOS Signing Identity
2. Set Environment Variable SWSWrappedAppFile to the full path to the wrapped app
3. Set Environment Variable SWSProvisioningProfile to the app Mobile Provisioning Profile (see Known Issues section below)

Example
```
export SWSSIGNIDENTITY="iPhone Distribution: My Company Name, LLC (45G34YW73X)"
export SWSWrappedAppFile="/Users/shikhir/sws/script/ECL-v5-wrapped-unsigned.ipa"
export SWSProvisioningProfile="/Users/shikhir/sws/ECLAppProfile.mobileprovision"
./SWSiOSResign
```

OR

Just type in ./SWSiOSResign and you will be prompted to enter the parameters

**Known Issues**

1. This script will not work if a wildcard mobile provisioning profile is used. Please sign manually according to the [docs](http://developer.blackberry.com/devzone/develop/enterprise/resign_work_space_app.html) if using a wildcard mobile provisioning profile is a must.
2. Ensure app name or file names do not contain spaces

**Additional Documentation**
* [Blog: Using the script](http://devblog.blackberry.com/2014/10/re-signing-ios-apps/)
* [Blog: Differences between Enterprise and Partner Wrapping](http://devblog.blackberry.com/2014/12/secure-work-space-enterprise-and-partner-wrapping/)

## Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

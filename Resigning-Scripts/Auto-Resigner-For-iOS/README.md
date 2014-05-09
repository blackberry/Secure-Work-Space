# SWS Auto-Resigner Script

The purpose of this script is to simplify the resigning of an iOS Secure Work Space app. Apps need to be re-signed after they are wrapped with BES. Wrapping an app invalidates it's previous signature. The manual process for wrapping an app is documented on [developer.blackberry.com](http://developer.blackberry.com/devzone/develop/enterprise/install_android_or_ios_work_space_app.html) and the [BES Universal Device Service Documentation](http://docs.blackberry.com/en/admin/deliverables/62506/BES10_v10.2.1_UDS_Advanced_Admin_Guide_en.pdf)


The sample code for this application is Open Source under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).


**Author**

* [Shikhir Singh](http://code.shikhir.com/)


**Release History**

* **V1.0.0** - Initial Release
* **V1.0.1** - Bug fixes

**Dependencies**

* OSX
* Xcode Command Line Tools
* BES Wrapped iOS App(the .ipa file)
* [iOS Enterprise Signing Keys](https://developer.apple.com/programs/ios/enterprise/)


**How to re-sign a wrapped app using this script**

1. Set Enviroment Variable SWSSIGNIDENTITY to the iOS Signing Identity
2. Set Enviroment Variable SWSWrappedAppFile to the full path to the wrapped app
3. Set Enviroment Variable SWSProvisioningProfile to the app Mobile Provisioning Profile

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
None


## Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

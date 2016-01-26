
Mikor 
===

Purpose:
---
#####Mikor is a client uesd to view your Sina Weibo. will take more useful function <br/>

#####Language:Swift

---

UpdateInfo:
---
2016-01-26:强制将NSAllowsArbitraryLoads属性设置为YES 



# iOS9的适配问题
由于iOS9的发布影响了微博SDK与应用的集成方式，为了确保好的应用体验，我们需要采取如下措施：
###1.对传输安全的支持
在新一代的iOS系统中，默认需要为每次网络传输建立SSL。解决这个问题有两种方法：

- A.建立白名单并添加到你的app的plsit中
- 
	<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSExceptionDomains</key>
		<dict>
			<key>sina.cn</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
				<false/>
			</dict>
			<key>weibo.cn</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
				<false/>
			</dict>
			<key>weibo.com</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
				<true/>
				<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
				<false/>
			</dict>
		</dict>
	</dict>

如果没有添加可能会遇到"An SSL error has occurred and a secure connection to
the server cannot be made."这样的问题。

- B.强制将NSAllowsArbitraryLoads属性设置为YES，并添加到你应用的plist中
- 
	<key>NSAppTransportSecurity</key>
	<dict>
	<key>NSAllowsArbitraryLoads</key>
	</true>
	</dict>

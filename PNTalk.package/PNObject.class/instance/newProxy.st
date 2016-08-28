proxy
newProxy
	| proxy |
	proxy := PNtalkObjectProxy new inner: self.
	proxies add: proxy.
	^ proxy.
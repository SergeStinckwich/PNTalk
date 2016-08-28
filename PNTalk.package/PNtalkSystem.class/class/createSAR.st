packaging
createSAR

	| srcDir zip releaseVersion string |
	srcDir := 'package-cache'.
	releaseVersion := '081218'.
	
	zip := ZipArchive new. 
	(zip addFile: srcDir, '/', 'PNtalk-Core-rk.11.mcz' as: 'PNtalk-Core.mcz') desiredCompressionLevel: 0. 
	zip addString: 'self fileInMonticelloZipVersionNamed: ''PNtalk-Core.mcz''.' as: 'install/preamble'.

	(zip addFile: 'PNtalk-classes.rps' as: 'PNtalk-classes.rps') desiredCompressionLevel: 0. 
	string := 'self extractMember: ''PNtalk-classes.rps''.'.
	string := string, String lf, 'PNtalkSystem loadPNClasses: ''PNtalk-classes.rps''.', String lf.
	zip addString:  string as: 'install/postscript'.
	
	zip writeToFileNamed: 'PNtalk', '-', releaseVersion, '.sar'.
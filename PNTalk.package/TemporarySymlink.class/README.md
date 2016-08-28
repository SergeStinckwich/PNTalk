I am used as a replacement of hard links to shared objects before serialization of PrototypeObjects. Since I am a proxy, all is working like without me.

After deserialization, it is possible to keep my instances living, or remove them by executing:

Smalltalk garbageCollect.
TemporarySymlink allInstances do: [ :s | s replaceYourselfByTarget ].

Check the result:

Smalltalk garbageCollect.
TemporarySymlink allInstances


TO DO (after testing phase): Replace symlinks by targets automagically immediately after their first successfull use (when target exists).


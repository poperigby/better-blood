--[[
  Provides read-only access to data directories via VFS.
  Interface is very similar to "io" library.
  local vfs = require('openmw.vfs')
]]

local record vfs
  interface FileHandle
    --[[
      Close a file handle
    ]]
    close: function(
      self: vfs.FileHandle
    ): boolean, --[[true if a call succeeds without errors.]]
      nil | string
    
    --[[
      VFS path to related file
    ]]
    fileName: string
    
    --[[
      Get an iterator function to fetch the next line from a given file.
      Throws an exception if the file is closed.
      
      Hint: since garbage collection works once per frame,
      you will get the whole file in RAM if you read it in one frame.
      So if you need to read a really large file, it is better to split reading
      between different frames (e.g. by keeping a current position in file
      and using a "seek" to read from saved position).
      f = vfs.open("Test\\test.txt");
      for line in f:lines() do
          print(line);
      end
    ]]
    lines: function(
      self: vfs.FileHandle
    ): function
    
    --[[
      Read data from a file to strings.
      Throws an exception if the file is closed, if there are too many arguments or if an invalid format is encountered.
      
      Hint: since garbage collection works once per frame,
      you will get the whole file in RAM if you read it in one frame.
      So if you need to read a really large file, it is better to split reading
      between different frames (e.g. by keeping a current position in file
      and using a "seek" to read from saved position).
      -- read three numbers from file
      f = vfs.open("Test\\test.txt");
      local n1, n2, n3 = f:read("*number", "*number", "*number");
    ]]
    read: function(
      self: vfs.FileHandle,
      ...: any
    ): string
    
    --[[
      Set new position in a file.
      Throws an exception if the file is closed or seek base is incorrect.
      -- set pointer to beginning of file
      f = vfs.open("Test\\test.txt");
      f:seek("set");
    ]]
    seek: function(
      self: vfs.FileHandle,
      whence: string, --[[Seek base (optional, "cur" by default). Can be:
      
        * "set" - seek from beginning of file;
        * "cur" - seek from current position;
        * "end" - seek from end of file (offset needs to be <= 0);]]
      offset: number
    ): number, --[[new position in file if a call succeeds without errors.]]
      nil | string
    
  end
  --[[
    Check if a file exists in VFS
    local exists = vfs.fileExists("Test\\test.txt");
  ]]
  fileExists: function(
    fileName: string
  ): boolean
  
  --[[
    Get an iterator function to fetch the next line from a file with the given path.
    Throws an exception if the file is closed or the file with the given path does not exist.
    Closes the file automatically when it fails to read any more bytes.
    
    Hint: since garbage collection works once per frame,
    you will get the whole file in RAM if you read it in one frame.
    So if you need to read a really large file, it is better to split reading
    between different frames (e.g. by keeping a current position in file
    and using a "seek" to read from saved position).
    for line in vfs.lines("Test\\test.txt") do
        print(line);
    end
  ]]
  lines: function(
    fileName: string
  ): function
  
  --[[
    Open a file
    f, msg = vfs.open("Test\\test.txt");
    -- print file name or error message
    if (f == nil)
        print(msg);
    else
        print(f.fileName);
    end
  ]]
  open: function(
    fileName: string
  ): vfs.FileHandle, --[[Opened file handle if a call succeeds without errors.]]
    nil | string
  
  --[[
    Get an iterator function to fetch file names with given path prefix from the VFS
    -- get all files with given prefix from VFS index
    for fileName in vfs.pathsWithPrefix("Music\\Explore") do
        print(fileName);
    end
  ]]
  pathsWithPrefix: function(
    path: string
  ): function
  
  --[[
    Detect a file handle type
    f = vfs.open("Test\\test.txt");
    print(vfs.type(f));
  ]]
  type: function(
    handle: any
  ): string
  
end
return vfs
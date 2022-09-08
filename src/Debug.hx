class Debug {

    public static var date = DateTools.format(Date.now(), "%Y-%m-%d__%H-%M-%S"); //used for file
    static var dateTime = DateTools.format(Date.now(), "%H:%M:%S"); //used for time of error

    static var path = Sys.getEnv(if (Sys.systemName() == "Windows") "UserProfile" else "HOME") + '\\AppData\\Local\\Wicked Engine';
    static var dfile = '${date}.txt';

    var fs = sys.FileSystem; //allows access to files
    static var f = sys.io.File; //allows editting to files

    public static var dfp = '$path\\$dfile';
    public static var debugFile:sys.io.FileOutput;
    
    public static function debug(v:Dynamic) {
        var line = '[Wicked Engine] -=- ${v}';

        trace(line); //logs on terminal,
        debugFile.writeString("\n"+line); //then logs in file for verifying later
    }

    public static function warn(v:Dynamic) {
        var line = '[Wicked Engine (WARN)] !=! ${v}';

        trace(line);
        debugFile.writeString('\n $line, TIME OF WARN: $dateTime'); //! if something doesn't seem right, use warn instead of debug!
    }

    public function new(?file:String) {
        if (!fs.isDirectory(path) && !fs.exists(path) && file == null) { //if path isn't a directory, or doesn't exist, and we haven't been provided a file,
            fs.createDirectory(path); //make the directory,

            debugFile = f.append('$dfp', false); //make the file at that path,

            debugFile.writeString("[Wicked Engine] -=- D: successful file creation"); //first debug!
            debug('D: first run, time is $dateTime'); //and log when we made it
            debug('D: {J:} if you run into any glitchiness, errors, or overall freakiness with Wicked Engine,'); //* PLEASE CHANGE THIS IF YOU'RE EDITING THE SOURE CODE,
            debug('D: that is NOT part of the game (aka, rebooting, etc), please DM jay.hx#4380'); //* I CANNOT HELP YOUR MOD BE PROGRAMMED PROPERLY, I JUST GIVE RESOURCES
            debug('D: {/J:} so that i can push out an update potentially fixing your issue ASAP!');

        } else { //or,


            if (file == null) { //we haven't been provided a file to edit to,
                debugFile = f.append('$dfp', false); //make one
                debugFile.writeString("[Wicked Engine] -=- D: successful file creation");
                debug('D: {J:} if you run into any glitchiness, errors, or overall freakiness with Wicked Engine,');
                debug('D: that is NOT part of the game (aka, rebooting, etc), please DM jay.hx#4380');
                debug('D: {/J:} so that i can push out an update potentially fixing your issue ASAP!');
            } else { //or we HAVE,
                debugFile = f.append('$file', false); //! append to that file, ! IF YOU GET ERRORS HERE, YOU FUCKED UP THE PATH!
                debugFile.writeString('\n[Wicked Engine (WARN)] !=! D: hooked again elsewhere -- ERRORS WILL HAPPEN IN A DIFFERENT FILE, CHECK PREFIX');
            }

        }
    }


}

/*
 ! HOW TO: Debug Files
 - Make a file -> link that file for any other .hx file to use as a log file (with Debug.debug/Debug.warn)
 */

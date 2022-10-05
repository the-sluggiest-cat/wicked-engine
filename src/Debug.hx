class Debug {

    //! I DO NOT, NOR WILL EVER WORK FOR YOUR WICKED ENGINE, SOURCE OR HSCRIPT MODS IF YOU MAKE THEM
    //! IF YOU HAVE DEBUG ISSUES, THAT IS THE RESULT OF A MOD, PLEASE DO NOT DM ME, DM THE MOD CREATOR
    //! PLEASE AND THANK YOU! - J

    public static var date = DateTools.format(Date.now(), "%Y-%m-%d__%H-%M-%S"); //used for file
    static var dateTime = DateTools.format(Date.now(), "%H:%M:%S"); //used for time of error

    static var path = Sys.getEnv(if (Sys.systemName() == "Windows") "UserProfile" else "HOME") + '\\AppData\\Local\\Wicked Engine';
    static var dfile = '${date}.txt';

    var fs = sys.FileSystem; //allows access to files
    static var f = sys.io.File; //allows editting to files

    public static var dfp = '$path\\$dfile';
    public static var debugFile:sys.io.FileOutput;

    static var prefix = "[Wicked Engine]";
    
    public static function debug(v:Dynamic) {
        var line = '$prefix -=- ${v}';

        trace(line); //logs on terminal,
        debugFile.writeString("\n"+line); //then logs in file for verifying later
    }

    public static function warn(v:Dynamic) {
        var line = '$prefix !=! ${v}';

        trace(line);
        debugFile.writeString('\n $line, TIME OF WARN: $dateTime'); //! if something doesn't seem right, use warn instead of debug!
    }

    var message:Array<String> = [ //! PLEASE CHANGE THIS WHEN WORKING WITH SOURCE CODE!!
        'D: time is $dateTime',
        "D: {J:} if you run into any glitchiness, errors, or overall freakiness with Wicked Engine,",
        "D: that is NOT part of the game (such as modcharts, or songs, or whatever,) please DM me, jay.hx#4380",
        "D: {/J:} so that i can push out an update potentially fixing your issue ASAP!"
    ];

    public function new(?file:String) {
        if (!fs.isDirectory(path) && !fs.exists(path) && file == null) { //if path isn't a directory, or doesn't exist, and we haven't been provided a file,
            fs.createDirectory(path); //make the directory,

            debugFile = f.append('$dfp', false); //make the file at that path,

            debugFile.writeString('$prefix -=- D: successful file creation'); //first debug!
            for (i in 0...message.length) {
                debug(message[i]);
            }
        } else { //or,


            if (file == null) { //we haven't been provided a file to edit to,
                debugFile = f.append('$dfp', false); //make one
                debugFile.writeString('$prefix -=- D: successful file creation');
                for (i in 0...message.length) {
                    debug(message[i]);
                }
            } else { //or we HAVE,
                debugFile = f.append('$file', false); //! append to that file, IF YOU GET ERRORS HERE, YOU FUCKED UP THE PATH!
                debugFile.writeString('\n$prefix !=! D: hooked again elsewhere -- ERRORS WILL HAPPEN IN A DIFFERENT FILE, CHECK PREFIX');
            }
        }
    }


}

/*
 ! HOW TO: Debug Files
 - Make a file -> link that file for any other .hx file to use as a log file (with Debug.debug/Debug.warn)
 */


//*VARIABLE SEQUENCE:
//path -> dfile -> date -> dfp -> debugFile -> new() -> debug()/warn() -(if warn)-> dateTime

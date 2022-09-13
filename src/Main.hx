import hxd.res.Sound;

class Main extends hxd.App {

    override function init() {

        hxd.Res.initEmbed();

        var music:Sound = null;

        new Debug();

        Debug.debug('M: Debug hook successful'); //* verify we're working!

        if(hxd.res.Sound.supportedFormat(OggVorbis)){
            music = hxd.Res.wickedMenu; //! HEAPS DOESN'T LIKE -, USE ONE FULL WORD FOR IT
        }

        if (music != null) {
            music.play(); //! ON MY BUILD, FOR SOME REASON, MUSIC PLAYS FOR ~3 SECONDS, THEN CUTS OUT.
            //TODO: figure out what the hell is happening here
        }

    }

    public static function main() {
        new Main();
    }

}

/*
TODO: Main.hx
- play the track before loop
- bump text per beat
- on a certain beat, change to MainMenu.hx
*/

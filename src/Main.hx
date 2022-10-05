import hxd.res.Sound;

class Main extends hxd.App {

    static var music:hxd.snd.Channel;
    static var actualMusic:hxd.res.Sound;

    override function init() {

        hxd.Res.initEmbed();

        new Debug();

        Debug.debug('M: Debug hook successful'); //* verify we're working!

        if(hxd.res.Sound.supportedFormat(Mp3)){
            actualMusic = hxd.Res.wickedMenu_mp3; //! HEAPS DOESN'T LIKE -, USE ONE FULL WORD FOR IT
        }

        music = actualMusic.play(true); //! ON MY BUILD, FOR SOME REASON, MUSIC PLAYS FOR NOT EVEN A SECOND, THEN CUTS OUT.
        //TODO: figure out what the hell is happening here

    }

    public static function main() {
        new Main();
    }

    override function update(dt:Float) {
    }

}

/*
TODO: Main.hx
- play the track before loop
- bump text per beat
- on a certain beat, change to MainMenu.hx
*/

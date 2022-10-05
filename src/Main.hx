import hxd.res.Sound;

class Main extends hxd.App {

    var music:hxd.snd.Channel;
    var actualMusic:hxd.res.Sound;

    override function init() {
        @:privateAccess haxe.MainLoop.add(() -> {});
        hxd.Window.getInstance().addEventTarget(onEvent);
        //! THIS IS A BUG WITH STABLE BRANCH OF HAXE, THIS IS REQUIRED IF YOU'RE MODIFYING SOURCE CODE
        //! OTHERWISE, SONGS, AUDIO, ANYTHING ELSE SYNCING TO RESOURCES *WILL* FAIL
        //* thank you to Yanrishatum for pinning this solution to the #heaps channel in Haxe's discord server
        //* https://discord.gg/ZQykrvyzjw <= invite link to the Haxe discord server, if you have a bug with Heaps, hit them up
        //* i STRONGLY advise that you try everything else BEFORE going to them, be a smart programmer.

        hxd.Res.initEmbed();

        new Debug();

        Debug.debug('M: Debug hook successful'); //* verify we're working!

        if(hxd.res.Sound.supportedFormat(Mp3)){
            actualMusic = hxd.Res.wickedMenu_mp3; //! HEAPS DOESN'T LIKE -, USE ONE FULL WORD FOR IT
        }

        music = actualMusic.play(true);

    }

    public static function main() {
        new Main();
    }

    override function update(dt:Float) {
    }

}

function onEvent(event : hxd.Event) {
    switch(event.kind) {
        case EKeyDown: switch(event.keyCode) {
            case 81: Debug.debug('M: closing!'); Sys.exit(0);
            case _:
        }
        case _:
    }
}

/*
TODO: Main.hx
- play the track before loop
- bump text per beat
- on a certain beat, change to MainMenu.hx
*/
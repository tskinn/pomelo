
using Gtk;
using Granite;


namespace Pomelo {

    public class Preferences : Gtk.Dialog {
    
        public Preferences (Gtk.Window window) {
            //Object (use_header_bar: 1);
            this.title = "Preferences";
            this.border_width = 5;
            set_default_size (300, 300);
            this.destroy.connect (() => {
                close ();
            });
            resizable = true;
            
            //var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
            var box = get_content_area () as Gtk.Box;
            var close = new Gtk.Button.with_label ("Close");
            close.activate.connect (() => {
                print ("Hello");
                this.destroy ();
            });
            box.pack_start (close, false, false, 0);
            
            this.add (box);
            //(get_header_bar () as Gtk.HeaderBar).show_close_button = false;
            //get_header_bar ().get_style_context ().remove_class ("header-bar");
            
        } 
    }
}

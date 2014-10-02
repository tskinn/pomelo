/* Copyright 2014 Taylor Skinner
*
* This file is part of Pomelo.
*
* Pomelo is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* Pomelo is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Pomelo. If not, see http://www.gnu.org/licenses/.
*/

using Granite.Services;

namespace Pomelo {
    
    public class PomeloApp : Granite.Application {
        
        private MainWindow window = null;
        
        construct {
            program_name = "Pomelo";
            exec_name = "Pomelo";
            
            build_data_dir = Constants.DATADIR;
            build_pkg_data_dir = Constants.PKGDATADIR;
            build_release_name = Constants.RELEASE_NAME;
            build_version = Constants.VERSION;
            build_version_info = Constants.VERSION_INFO;
            
            app_years = "2014";
            app_icon = "pomelo";
            app_launcher = "pomelo.desktop";
            application_id = "net.launchpad.pomelo";
            
            main_url = "https://code.launchpad.net/pomelo";
            bug_url = "https://bugs.launchpad.net/pomelo";
            help_url = "https://code.launchpad.net/pomelo";
            translate_url = "https://translations.launchpad.net/pomelo";
            
            about_authors = { "Taylor Skinner <tskinn12@gmail.com>" };
            about_documenters = { "Taylor Skinner <tskinn12@gmail.com>" };
            about_artists = { "Taylor Skinner <tskinn12@gmail.com>" };
            about_comments = "Pomelo";
            about_translators = "";
            // Set the about_license_type property to set your license
        }
        
        public PomeloApp () {
            Logger.initialize ("Pomelo");
            Logger.DisplayLevel = LogLevel.DEBUG;   
        }
        
        //the application started
        public override void activate () {
            if (get_windows () == null) {
                window = new MainWindow (this);
                window.show_all ();
            } else {
                window.present ();
            }
        }
        
        //the application was requested to open some files
        public override void open (File [] files, string hint) {
            
        }
        
        public static void main (string [] args) {
            var app = new Pomelo.PomeloApp ();
            
            app.run (args);
        }
    }
}
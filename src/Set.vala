

namespace Pomelo {
    public class Set {
        
        public int pomos_completed { get; private set; }
            
        private Countdown pomodoro;
        private Countdown brek;
        private Countdown long_brek;
    
        private Countdown* current;
 
        public int time_left { get; private set;}
        public int time_passed { get; private set;}
        private DateTime start;
        private DateTime end;
    
        private bool is_running;
    
        public Set () {
            pomodoro = new Countdown (300, "Pomodoro", 1);
            brek = new Countdown (300, "Break", 2);
            long_brek = new Countdown (900, "Long Break", 4);
        }
        
        public Set.with_lengths (int len_pomodoro_sec, int len_break_sec, 
                    int len_long_break_sec, int long_break_freq) {
            
            pomodoro = new Countdown (len_pomodoro_sec, "Pomodoro", 1);
            brek = new Countdown (len_break_sec, "Break", 2);
            long_brek = new Countdown (len_long_break_sec, "Long Break", 
                                        long_break_freq);
            
            /*
            this.len_pomodoro = len_pomodoro_sec;
            this.len_break = len_break_sec;
            this.len_long_break = len_long_break_sec;
            this.long_break_freq = long_break_freq;
            */
        }
        
        public void start_session () {
            is_running = true;
            pomos_completed = 0;
            start = new DateTime.now_local ();
            current = pomodoro;
        }
        
        private void continue_session () {
            start = new DateTime.now_local ();
        }
        
        public int update () { // change to into to support more message types ??/
            if (!is_running)      
                return 1;    // return signifying interuption?
            DateTime check = new DateTime.now_local ();
            int difference = (int) check.difference (start);      
            time_passed = difference / 1000000; // convert to seconds
            time_left = current->len_seconds - time_passed;
            if (time_left <= 0) {
                set_next_countdown ();
                continue_session ();
                return 2;    // return signifying successful countdown
            }
            else
                return 3;     // return nothienr
        }
        
        private void set_next_countdown () {
            if (current == pomodoro) {
                pomos_completed++;
                print ("Something\n\n\nSometing\n");
                if (pomos_completed == long_brek.frequency)
                    current = long_brek;
                else
                    current = brek;
            }
            else
                current = pomodoro;
        }   
        
        
        public void stop () {
            if (!is_running)
                return;
            end = new DateTime.now_local ();
            is_running = false;
        }
        
        public int get_seconds_left () {
            return time_left % 60;
        }
        
        public int get_minutes_left () {
            return time_left / 60;
        }
        
        public string get_current_name () {
            return current->name;
        }
        
        public int get_total_length () {
            return current->len_seconds;
        }
        
    }
}

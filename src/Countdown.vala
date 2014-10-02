

namespace Pomelo {
    public class Countdown {
        public int len_seconds { get; private set; }
        public string name { get; private set; }
        public int frequency { get; private set; }    // how often this timer occurs in a set
        
        
        public Countdown (int seconds, string name, int frequency) {
            this.len_seconds = seconds;
            this.name = name;
            this.frequency = frequency;
        }
    }
}
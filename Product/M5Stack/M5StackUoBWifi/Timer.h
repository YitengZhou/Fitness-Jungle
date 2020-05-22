#ifndef _TIMER_H
#define _TIMER_H

// A class to help us run code at specified
// time intervals.  You might want to use this
// as a template to make your own arduino classes
class Timer {


  private:
    unsigned long period;   // user requested time period
    unsigned long last_ts;  // saved time stamp 
    boolean READY = false;  // flag if time has elapsed


  public:

    // Constructor, call with the number of milliseconds
    // you wish to schedule some code on.
    Timer( unsigned long period_ms ) {
      period = period_ms;
      last_ts = millis();
    }

    // Call to see if the time period has elapsed
    // Note, only reset() will toggle the timer 
    // back to watching time again.
    boolean isReady() {

      // Check for elapsed time between system time
      // millis and the last time stamp taken
      if ( millis() - last_ts > period ) {
        READY = true;
      } 
      
      return READY; 
    }

    // Use to reset your timer. 
    void reset() {
      last_ts = millis(); // save current system time
      READY = false;      // reset flag to false
    }

    void setNewPeriod( unsigned long period_ms ) {
      period = period_ms;
    }

    
};


#endif

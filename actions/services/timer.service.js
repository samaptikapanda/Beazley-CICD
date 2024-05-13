class TimerService {
  constructor() {
    this.timer = null;
  }

  // Function to pause the process for a given number of milliseconds
  pause(milliseconds) {
    return new Promise((resolve) => {
      this.timer = setTimeout(() => {
        resolve();
      }, milliseconds);
    });
  }

  // Function to cancel the current timer
  clear() {
    clearTimeout(this.timer);
  }
}
module.exports = TimerService;

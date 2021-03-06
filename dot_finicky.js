// Generated by Finicky Kickstart

module.exports = {
  defaultBrowser: "Firefox",
  options: {
    // hide from top bar
    hideIcon: true,
    // don't check for updates - should be handled by brew cask updates
    checkForUpdate: false,
  },
  handlers: [
    {
      match: /^https?:\/\/meet\.google\.com\/.*$/,
      browser: "Google Chrome"
    }
  ],
}

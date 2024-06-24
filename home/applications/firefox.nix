{ pkgs, ... }:

let
  settings = {
    "browser.toolbars.bookmarks.visibility" = "always";
    "layout.css.devPixelsPerPx" = "1.25";

    # Taken directly from within broswer after setting up
    "browser.uiCustomization.state" = ''
      {"placements":{"widget-overflow-fixed-list":["history-panelmenu","bookmarks-menu-button","save-to-pocket-button","preferences-button"],"unified-extensions-area":["jid1-mnnxcxisbpnsxq_jetpack-browser-action","jid1-93cwpmrbvpjrqa_jetpack-browser-action","vimium-c_gdh1995_cn-browser-action","dtu_course_analyzer_gmail_com-browser-action","adblockultimate_adblockultimate_net-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","customizableui-special-spring1","urlbar-container","sync-button","privatebrowsing-button","downloads-button","customizableui-special-spring2","addon_darkreader_org-browser-action","_5c46d283-abde-4dce-b83c-08881401921c_-browser-action","logins-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","jid1-93cwpmrbvpjrqa_jetpack-browser-action","vimium-c_gdh1995_cn-browser-action","_5c46d283-abde-4dce-b83c-08881401921c_-browser-action","addon_darkreader_org-browser-action","dtu_course_analyzer_gmail_com-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","adblockultimate_adblockultimate_net-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","unified-extensions-area","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":19,"newElementCount":4}
    '';
  };
in {
  programs.firefox = {
    enable = true;

    profiles.default = {
      inherit settings;
      isDefault = true;
    };
  };
}

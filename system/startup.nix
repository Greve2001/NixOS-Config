{
  systemd.user.services.nextcloud-client = {
    description = "Nextcloud Service";
    script = "nextcloud &";
    wantedBy = [ "multi-user.target" ]; # At login
  };
}

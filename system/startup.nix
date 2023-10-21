let login = [ "multi-user.target" ];
in
{
  systemd.user.services.nextcloud-client = {
    description = "Nextcloud Service";
    script = "nextcloud &";
    wantedBy = login;
  };
}


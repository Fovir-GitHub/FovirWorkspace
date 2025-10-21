{
  # Ensure this is unique among all clans you want to use.
  meta.name = "Fovir";

  inventory.machines = {
    # Define machines here.
    fovirbox = {
      deploy.targetHost = ./machines/fovirbox/values/targethost.nix;
      tags = [];
    };
  };

  # Docs: See https://docs.clan.lol/reference/clanServices
  inventory.instances = {
    # Docs: https://docs.clan.lol/reference/clanServices/zerotier/
    # The lines below will define a zerotier network and add all machines as 'peer' to it.
    # !!! Manual steps required:
    #   - Define a controller machine for the zerotier network.
    #   - Deploy the controller machine first to initialize the network.
    zerotier = {
      # Replace with the name (string) of your machine that you will use as zerotier-controller
      # See: https://docs.zerotier.com/controller/
      # Deploy this machine first to create the network secrets
      roles.controller.machines."__YOUR_CONTROLLER__" = {};
      # Peers of the network
      # tags.all means 'all machines' will joined
      roles.peer.tags.all = {};
    };

    # Docs: https://docs.clan.lol/reference/clanServices/tor/
    # Tor network provides secure, anonymous connections to your machines
    # All machines will be accessible via Tor as a fallback connection method
    tor = {
      roles.server.tags.nixos = {};
    };
  };
}

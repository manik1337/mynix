{ ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "v111";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [ ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDfu9bEONAzrybmoUfe4bHmRcYigVckQ15CoQk4eV7RSeJNGL5glJfeFFWjZRoolizjR2Ht+PEa/hW5LLYZO1Ke0p4WZEf8vl7iDjUrGV+mQ7TebqzwiVc37MOyXgUqk/4JjSWnAlufj9T9pcVf0DSdCc+JpqCHAv6VYWYk80BX5IEwzhLxolGEKqPZpj3ao/O3TI4TCBPX/pYUQgQRM2fSBHqz8zuP/sj1jD/6vzcqPKr5ZHJAFyyBtVzy2v1HFcbc6WcS9LfDhLU8Yp3ksp+6vbwMTRPZkPnEgaNitlALYuFDorHHuAw/7H+kyUtW78kqu0x6qMw7gloeLhOoll3r9tw2VRdVQzGVAMj/Cy3wjNvfQgl7eyi3hlFTKNzKSPQ1qb39lIJ1BCqGu3YZcfqGS8aJHU8waifsQuTIBvMZdQYKhIj1Yn2r2eqzDCz7Lnetg+RQAlRsVJeSwBexlbo/wRZoii4YD1yHNz/u95XbhSRRPoImE4PWORLV0Lcji0= dmanik@nixos'' ];
  system.stateVersion = "23.11";
}

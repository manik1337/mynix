self: super: {
  dwm = super.dwm.overrideAttrs (oldAttrs: rec {
    configFile = super.writeText "config.h" (builtins.readFile ./dwm-config.h);
    postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
    patches = [
      (super.fetchpatch {
        url = "https://dwm.suckless.org/patches/fibonacci/dwm-fibonacci-6.2.diff";
        sha256 = "12y4kknly5irwd6yhqj1zfr3h06hixi2p7ybjymhhhy0ixr7c49d";
      })
      (super.fetchpatch {
        url = "https://dwm.suckless.org/patches/actualfullscreen/dwm-actualfullscreen-20211013-cb3f58a.diff";
        sha256 = "0882k8w6651c18ina0245b558f1bvqydcycw07lp711hpbg7f9gv";
      })
      (super.fetchpatch {
        url = "https://dwm.suckless.org/patches/attachbottom/dwm-attachbottom-20201227-61bb8b2.diff";
        sha256 = "1afk7yr3xrcz2py26f38ngh6yq2321za1g6dnrdrwik59ixbn2h0";
      })
      (super.fetchpatch {
        url = "https://dwm.suckless.org/patches/autostart/dwm-autostart-20210120-cb3f58a.diff";
        sha256 = "1gksmq7ad3fs25afgj8irbwcidhyzh0cmba7vkjlsmbdgrc131yp";
      })
      (super.fetchpatch {
        url = "https://dwm.suckless.org/patches/pertag/dwm-pertag-6.2.diff";
        sha256 = "042bp41sn8dvjkxnw1bclc268ik6g7cg5qalvx89xpmz5pqs0p85";
      })
    ];
  });
}

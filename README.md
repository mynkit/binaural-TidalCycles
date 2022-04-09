# binaural-TidalCycles

3D sound with TidalCycles.

# Required

- [SuperCollider](https://github.com/supercollider/supercollider): version 3.10 or later.
- [TidalCycles](https://github.com/tidalcycles/Tidal)

This project uses [atk-sc3](https://github.com/ambisonictoolkit/atk-sc3).

Install atk-sc3 on SuperCollider Editor with the following command.

```SuperCollider
Quarks.install("https://github.com/ambisonictoolkit/atk-sc3.git");
```

After installing quarks, you must also one time recompile the class library. A easy way to do so is to quit scide and restart it; other ways are to type ctrl+shift+L in scide or to use the “Recompile Class Library” in the Language menu of scide. (ref: https://scsynth.org/t/solved-when-using-the-atk-command-error-class-not-defined-is-displayed/5648/6?u=mynkit)

After recompiling, execute the following command.

```SuperCollider
Atk.downloadKernels;
Atk.downloadMatrices;
Atk.downloadSounds;
```

This completes the setup.

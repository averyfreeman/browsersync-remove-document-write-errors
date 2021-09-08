# `browser-sync` patch

### to get rid of error messages about `document.write` in devTools

---

This is a simple patch for `script-tags.tmpl` file in `browser-sync`

Recently required `browser-sync` for a project by way of `lite-server`. Noticed I was getting phantom `document.write` error in devTools, despite not being anywhere in the project. Finally I figured out it was `browser-sync`, and went hunting.

There were two solutions I came across: One was to patch the `browser-sync/templates/script-tags.tmpl` file, the other was to use a custom `bs-config.js` file in the root of the project.

Both seem to work equally well. It's up to you which you'd prefer to implement.

If you want to apply the patch file, there's a script that will do it for you. Just clone the repo to your project root, go into the resulting directory and run the script. It'll be called `patch-script-tags.sh`.

List of files:

```
bs-config.js                   # custom bs-config.js
patch-script-tags-template.sh* # patch for script-tags.tmpl
script-tags.patch              # the actual patch
script-tags.tmpl               # an example of the patched result
script-tags.tmpl.orig.tmpl     # the original unpatched file
```

You don't have to use both the `bs-config.js` and patch at the same time, just one or the other.

If you have any problems, or want to revert, there's more than enough information here for you to go back to the original, e.g. `patch -R`, `rm` new `cp` `.orig`, etc. There's instructions in the script about how to revert.

Looks like the `browser-sync` codebase hasn't been touched in several years, so I wouldn't worry too much about this becoming obsolete or getting kicked out by an update any time soon.

# Rack Fan Mount

Parametric OpenSCAD model for a modular Raspberry Pi rack fan mount.
Two 120 mm fans per side, mounted on a 2020 extrusion spine across 6U,
cantilevered off one rail and reaching ~80 mm into the rack (140 mm budget).

## Files

| File | What it is |
|------|------------|
| `config.scad` | Shared dimensions — the single source of truth. Edit numbers here. |
| `fan_carrier.scad` | **The part you fabricate** (one per fan). Flat profile: print or waterjet/CNC. |
| `spine.scad` | 2020 extrusion spine (you buy this; modelled for the assembly). |
| `bracket.scad` | Rack-mount bracket: post → spine, via M6 cage nuts. |
| `rack_post.scad` | Rack post, for context only (not fabricated). |
| `fan_dummy.scad` | Stand-in 120 mm fan, for fit/clearance only (you buy the real fan). |
| `assembly.scad` | The whole thing, built from the real part modules. |

## Viewing

Open `assembly.scad` in OpenSCAD, press F5, drag to orbit. All files include
`config.scad`, so change a dimension once and every part plus the assembly
update together.

## Fabricating

Open `fan_carrier.scad`, press F6, then export STL (or 3MF). It is a single
uniform thickness, so the same profile suits FDM/SLS printing or waterjet/CNC
from sheet. Set `thickness` in `config.scad` per process (6 mm is a good start).
Flip `side = "left"` for the mirrored part on the other rail.

## Notes

- Fan holes are plain M4 clearance for screws with rubber anti-vibration washers.
- Carrier bolts to the spine via two slotted M5 holes into T-nuts (±6 mm height adjust).
- The fan and rack post are stand-ins; the real carrier, spine slot, and bracket are the load path.

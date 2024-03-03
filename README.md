An open source 3D first-person player controller for [Godot Engine](https://godotengine.org/) (made in version *4.2+*). This controller currently supports air strafing, bunny hopping, crouching, walking, and more!

This asset is a big work in progress and we plan on adding more features along with improving the current player movement in the future as we develop our own [open source games](https://moddingcommunity.com/forum/335-dot-games/).

## Features
* Air strafing
* Bunny hopping
* Crouching
* Walking

## Godot Input Actions
The following input actions need to be added to the Godot project via *Project -> Project Settings -> Input Map* for the controller to work properly.

| Action | Description |
| ------ | ----------- |
| `player_l` | Moves the player to the left. |
| `player_r` | Moves the player to the right. |
| `player_f` | Moves the player forward. |
| `player_b` | Moves the player backward. |
| `player_jump` | Has the player jump. |
| `player_crouch` | Has the player crouch. |

**Note** - Mouse wheel up button is supported for the `player_jump` input!

**Note** - The `player_crouch` input works as a press/release. Therefore, the player must hold the input down to crouch and release it when they want to stop crouching.

## Controller Settings
The following are variables exported by the player controller that can be modified outside of the controller.

**Warning** - These settings are a bit messy right now and will be overhauled in the future!

| Setting | Default | Description |
| ------- | ------- | ----------- |
| `MAX_G_SPEED` | `6.0` | The maximum ground/base speed. |
| `MAX_W_SPEED` | `4.0` | The maximum walk speed. |
| `MAX_C_SPEED` | `3.0` | The maximum crouch speed. |
| `MAX_G_ACCEL` | `20.0` | The maximum acceleration speed. |
| `MAX_AIR_SPEED` | `0.5` | The maximum speed while in the air. |
| `MAX_AIR_ACCEL` | `100.0` | The maximum acceleration while in the air. |
| `JUMP_FORCE` | `4.5` | The force to apply vertically when jumping. |
| `GRAVITY_FORCE` | `15.0` | The gravity force to apply when the player is in the air. |
| `MAX_SLOPE` | `0.803` | *To Do...* |
| `LERP_SPEED` | `12.0` | The lerp time. This is times with the delta when using `lerp()` to smooth out player movement. |
| `FRICTION` | `10.0` | The amount of friction to apply to the player when moving. This is also used in the `lerp()` function when smoothing out player movement. |
| `CROUCH_DEPTH` | `-0.5` | Subtracts this value from the `y` position of the player controller's camera when the player is crouching. |
| `FLOOR_RAY_POS` | `(0, 0, 0)` | *To Do...* |
| `FLOOR_RAY_REACH` | `3.0` | How far to create a ray to the ground when detecting if the player is on the floor. |
| `MOUSE_SENS` | `0.002` | The mouse sensitivity. |
| `AUTO_BHOP` | `false` | When on, the player can hold in the `player_jump` input and automatically jump when detected on the floor. |

## Preview
Here are some GIFs and images showcasing the controller as of *3-2-24*.

### Video
![GIF 01](./images/previewgif1.gif)

### Images
![Image 01](./images/preview1.png)

![Image 02](./images/preview2.png)

## Credits
* [Christian Deacon](https://github.com/gamemann)
* [BleyChimera](https://github.com/BleyChimera) - Their code was a base for this controller with additions/changes. Thank you!
* [Prototype Textures](https://www.kenney.nl/assets/prototype-textures)
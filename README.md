Typically, maps without a skybox will end up looking like this:
<img width="1024" height="576" alt="image" src="https://github.com/user-attachments/assets/b2628577-fc0b-4647-ae5e-14aa47aa20ee" />


This plugin fixes that by making the skybox completely black when none is present (shown below)
<img width="1918" height="1079" alt="image" src="https://github.com/user-attachments/assets/320f816e-a94a-4edb-bd12-dd0e1fb721b3" />



`Cvars`
sm_noskybox_enabled - Toggles whether the plugin forces a black skybox on map start (1 = on, 0 = off; default 1)
sv_skyname - Engine cvar the plugin sets to "black"; controls which skybox material that clients load
sm_forceblacksky - Admin command that reapplies the black sky immediately without needing a map change

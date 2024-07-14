# Parrallel Compose

This is a project template used for running serveral docker compose instances in test environments such as CI in order to parallalize the testing process on a single instance.

Adding more services to the `docker-compose.yaml` would require altering the startup and shutdown scripts.

## Usage

Run the script in root dir in order to spawn a parallel docker compose

```bash
./src/up.sh <Version>
```

To shut down the container run the `down.sh` script in the same fashion as the startup

```bash
./src/down.sh <Version>
```

**Note** The script picks up the parent directory name to avoid conflicts with other projects.

## Generated Files

All generated files and directories, that are used in the processes should be put under the git ignored `data/` directory. Please put all volumes inside the `data/` sub folder.

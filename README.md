# Firedoc

Warm yourself to save the world!

Never bothered by your laptop getting hotter and hotter?

Try Firedoc, a POC showing you can warm up your home while curing diseases.

[World Community Grid](https://www.worldcommunitygrid.org/discover.action) is a project created by IBM.
It currently focus on providing computer power to scientifics for Ebola, AIDS, Childhood cancers and more.

Providing your computer power to scientifics research can help cure theses diseases faster and faster, it is really useful to the world.

But it generate heat. So let's make a heater!

## How to

- Clone this repository
- Install Docker
- Run `make build`. It will take a few minutes.
- Run `make first_start`. You will be logged in with a demo account on World Community Grid. It will last 2 minutes.
- Run `make run`. A `top` window will show up. Wait up to 10 minutes before `boinc` getting ready and computing.
- Go to `localhost:8081`. It is the main website. Read it.
- Below, there is a slider for the temperature. Take you desired temperature.
- See how the cpu use change according to your desired temperature.
- When you change the desired temperature, see in the `top` window how it affect the research CPU usage. Note that change may take up to 5 minutes to take effect.
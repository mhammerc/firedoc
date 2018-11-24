const fs = require('fs');
const {exec} = require('child_process');
const express = require('express');
const cors = require('cors');
const api = express();
const port = 8080;

const tempMin = 15;
const tempMax = 30;

let temp = 20;
let cpu = 100;

api.use(cors());

api.get('/', (req, res) =>
{
    res.json(
    {
        temp,
        cpu
    });
});

api.use(express.static('../client/dist'));

api.post('/temp/:temp', (req, res) =>
{
    temp = req.params.temp;
    updateBoincUsage();
    res.json({temp, cpu});
});

function updateBoincUsage()
{
    if (temp < 15 || temp > 30)
    {
        return;
    }

    cpu = Math.floor((temp - 15) / 15 * 100);
    const begin = "<global_preferences><cpu_usage_limit>"
    const end = "</cpu_usage_limit></global_preferences>"
    const text = begin + cpu.toString() + end;

    const file_path = "/data/boinc/global_prefs_override.xml";
    fs.writeFile(file_path, text, err =>
    {
        if (err)
        {
            console.error(err);
            return;
        }

        const p = exec('cd /data/boinc && /data/boinccmd/reload_prefs.sh');
        p.stdout.pipe(process.stdout);
        p.stderr.pipe(process.stderr);
        console.log(`Prefs overrided and loaded at ${cpu}%!`);
    });

}

updateBoincUsage();

api.listen(port, () => console.log(`Listening on *:${port}!`));
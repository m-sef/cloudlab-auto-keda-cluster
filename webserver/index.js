const express = require('express');
const app     = express();
const port    = 8080;

app.get("/", (request, response) => {
    const time_ms = parseFloat(request.query.burn);
    const time_start = Date.now();
    const time_end = time_start + time_ms;

    let x = 0.0;

    while (Date.now() <= time_end)
    {
        x += Math.sqrt(x + 1);
    }

    console.log(`burn=${time_ms}, ${x}`);

    response.sendStatus(200);
})

app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});
const cote = require('cote');
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());
const bloodService = new cote.Responder({ name: "Blood Service" });
const patientServiceRequester = new cote.Requester({ name: "Patient Service" });
const blood = [
  {
    id: 1,
    count: 10,
    blood_type: "A+"
  },
  {
    id: 1,
    count: 15,
    blood_type: "A-"
  },
  {
    id: 1,
    count: 5,
    blood_type: "AB+"
  },
]

bloodService.on("blood", req => {
  return Promise.resolve(blood);
})
app.get("/patients", async (req, res) => {
  const patients = await patientServiceRequester.send({ type: "patient" });
  res.json(patients).status(200);
})
app.listen(3002, () => { console.log("BLOOD RESPONDER") })
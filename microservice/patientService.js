const cote = require('cote');
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());
const patientServiceResponder = new cote.Responder({ name: "Patient Service" });
const bloodServiceRequester = new cote.Requester({ name: "Blood Service" });
const patients = [
  {
    id: 1,
    name: "John Doe",
    blood_type: "A+"
  },
  {
    id: 2,
    name: "Jane Doe",
    blood_type: "A-"
  }
]

// patientServiceResponder.on("patient", req => {
//   return Promise.resolve(patients);
// })
app.get("/available/blood", async (req, res) => {
  const availableBlood = await bloodServiceRequester.send({ type: "blood" });
  res.json(availableBlood).status(200);
})
app.listen(3001, () => { console.log("Patient Requester") })
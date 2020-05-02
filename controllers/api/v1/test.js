const express = require('express'),
  uuid = require('uuidv4'),
  router = express.Router();

router.get('/', (req, res) => {
  const testArr = [];
  const startDate = new Date();
  const endDate = new Date(startDate.setDate(startDate.getDate() + 1));
  testArr.push('test');
  const result = {};
  result.id = uuid();
  result.empId = 'EMP-123';
  result.empName = 'John';
  result.startTime = startDate;
  result.endTime = endDate;
  result.data = {
    id: uuid(),
    name: `Name ${uuid()}`,
    location: {
      country: 'INDIA',
      subLocation: {
        state: 'GOA',
        pinCode: '403501',
        area: {
          city: 'Porvorim',
        },
      },
    },
  };
  res.status(200).json({ success: true, data: result });
});

module.exports = router;


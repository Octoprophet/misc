function loadTable(table) {
        fetch(`/api/${table}`)
            .then(response => response.json())
            .then(data => {
                let names = data.map(row => `size: ${row.chrsize}\nfee type: ${row.chrFeeType}\nfee: ${row.FeeAmount}\n------------------------------\n`);
                document.getElementById('output').textContent = names.join('\n');
            })
            .catch(err => {
                document.getElementById('output').textContent = 'Error: ' + err;
            });
    }
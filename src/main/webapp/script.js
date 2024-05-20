document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('reservationForm');
    const successMessage = document.getElementById('reservationSuccess');

    form.addEventListener('submit', function(event) {
        event.preventDefault(); 

       
        const formData = new FormData(form);
        const entryDate = new Date(formData.get('entryDate'));
        const exitDate = new Date(formData.get('exitDate'));
        const carNumber = formData.get('carNumber');

     
        const millisecondsPerDay = 1000 * 60 * 60 * 24;
        const days = Math.ceil((exitDate - entryDate) / millisecondsPerDay);
        const parkingFee = days * 15000;

       
        document.getElementById('successEntryDate').textContent = entryDate.toLocaleDateString();
        document.getElementById('successExitDate').textContent = exitDate.toLocaleDateString();
        document.getElementById('successCarNumber').textContent = carNumber;
        document.getElementById('parkingFee').textContent = new Intl.NumberFormat('ko-KR').format(parkingFee) + '원';

        
        successMessage.classList.remove('hidden');


        form.reset();

       
        setTimeout(function() {
            successMessage.classList.add('hidden');
        }, 3000);
    });
});/**
 * 
 */
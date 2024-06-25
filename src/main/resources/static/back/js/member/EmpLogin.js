$(function() {
	$('.close').click(function() {
		$('#loginModal').modal('hide');
	});
})

function openLoginModal() {
	$('#loginModal').modal('show');
}

function loginByKey(type) {
	switch (type) {
		case 'boss': {
			$('#empAccount').val('bossTeam6');
			$('#empPassword').val('bossTeam6');
			$('#goLogin').submit();
			$('#loginModal').modal('hide');
			break;
		}
		case 'member': {
			$('#empAccount').val('staff1');
			$('#empPassword').val('123456');
			$('#goLogin').submit();
			$('#loginModal').modal('hide');
			break;
		}
	}
}
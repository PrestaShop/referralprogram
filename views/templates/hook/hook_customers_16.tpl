<div class="panel">
	<div class="panel-heading">{l s='Referral program'} <span class="badge">{count($friends)|intval}</span></div>
	{strip}
		<div class="panel-heading">
			{if isset($sponsor)}
				{l s='Customer\'s sponsor:'}
				&nbsp;<a href="index.php?tab=AdminCustomers&amp;id_customer={$sponsor->id}&amp;viewcustomer&amp;token={$token}">{$sponsor->firstname} {$sponsor->lastname}</a>
			{else}
				{l s='No one has sponsored this customer.'}
			{/if}
		</div>
	{/strip}
	<div class="panel-heading"><span class="badge">{count($friends)|intval}</span> {if count($friends) > 1}{l s='Sponsored customers:'}{else}{l s='Sponsored customer:'}{/if}</div>
	<table class="table">
		<thead>
			<tr>
				<th><span class="title_box">{l s='ID'}</span></th>
				<th><span class="title_box">{l s='Name'}</span></th>
				<th><span class="title_box">{l s='Email'}</span></th>
				<th><span class="title_box">{l s='Registration date'}</span></th>
				<th><span class="title_box">{l s='Customers sponsored by this friend'}</span></th>
				<th><span class="title_box">{l s='Placed orders'}</span></th>
				<th><span class="title_box">{l s='Customer account created'}</span></th>
			</tr>
		</thead>
		<tbody>
			{foreach key=key item=friend from=$friends}
			<tr{if $key++ % 2} class="alt_row"{/if}{if $friend['id_customer']} onclick="document.location='?controller=AdminCustomers&amp;id_customer={$friend.id_customer|intval}&amp;viewcustomer&amp;token={$token}'"{/if}>
				<td>{if $friend.id_customer}{$friend.id_customer}{else}--{/if}</td>
				<td>{$friend.firstname} {$friend.lastname}</td>
				<td>{$friend.email}</td>
				<td>{$friend.date_add}</td>
				<td>{$friend.sponsored_friend_count|intval}</td>
				<td>{$friend.orders_count|intval}</td>
				<td>{if $friend.id_customer}<i class="icon-check list-action-enable action-enabled"></i>{else}<i class="icon-remove list-action-enable action-disabled"></i>{/if}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>

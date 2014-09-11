<div class="clear">&nbsp;</div>
<h2>{l s='Referral program'} {count($friends)|intval}</h2>
<h3>
	{if isset($sponsor)}
		{l s='Customer\'s sponsor:'}
		<a href="index.php?tab=AdminCustomers&amp;id_customer={$sponsor->id}&amp;viewcustomer&amp;token={$token}">{$sponsor->firstname} {$sponsor->lastname}</a>
	{else}
		{l s='No one has sponsored this customer.'}
	{/if}
</h3>
<h3>{count($friends)|intval} {if count($friends) > 1}{l s='Sponsored customers:'}{else}{l s='Sponsored customer:'}{/if}</h3>
<table cellspacing="0" cellpadding="0" class="table">
	<tr>
		<th class="center">{l s='ID'}</th>
		<th class="center">{l s='Name'}</th>
		<th class="center">{l s='Email'}</th>
		<th class="center">{l s='Registration date'}</th>
		<th class="center">{l s='Customers sponsored by this friend'}</th>
		<th class="center">{l s='Placed orders'}</th>
		<th class="center">{l s='Customer account created'}</th>
	</tr>
	{foreach key=key item=friend from=$friends}
	<tr{if $key++ % 2} class="alt_row"{/if}{if $friend['id_customer']} style="cursor: pointer" onclick="document.location='?tab=AdminCustomers&amp;id_customer={$friend.id_customer}&amp;viewcustomer&amp;token={$token}'"{/if}>
		<td class="center">{if $friend.id_customer}{$friend.id_customer}{else}--{/if}</td>
		<td>{$friend.firstname} {$friend.lastname}</td>
		<td>{$friend.email}</td>
		<td align="right">{$friend.date_add}</td>
		<td>{$friend.sponsored_friend_count|intval}</td>
		<td align="right">{$friend.orders_count|intval}</td>
		<td align="center">{if $friend.id_customer}<img src="{$admin_image_dir}enabled.gif" />{else}<img src="{$admin_image_dir}disabled.gif"/>{/if}</td>
	</tr>
	{/foreach}
</table>

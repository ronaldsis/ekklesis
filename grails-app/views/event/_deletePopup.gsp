<div id="deletePopup" style="display: none;">

<g:form action="delete">
    <g:hiddenField name="id" value="${eventInstance.id}" />
    <g:hiddenField name="occurrenceStart" value="${occurrenceStart}" />

	<p>¿Quiere usted eliminar solo este evento, o todos los eventos en la serie?</p>

    <table>
        <tbody>
        <tr>
            <td><button type="submit" name="deleteType" value="occurrence">Solo este evento</button></td>
            <td>Todos los otros eventos en la serie permaneceran </td>
        </tr>

        <tr>
            <td><button type="submit" name="deleteType" value="following">Todos los que siguen</button></td>
            <td>This and all the following events will be changed. Este y todos los siguientes eventos seran cabiados</td>
        </tr>
        <tr>
            <td><button type="submit" name="deleteType" value="all">Todos los eventos en la series</button></td>
            <td>Todos los otros eventos en la serie permaneceran</td>
        </tr>
        </tbody>

    </table>

</div>


</g:form>

</div>


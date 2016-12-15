import React, { Component } from 'react';
import ReactDOM from 'react-dom';

class Clock extends Component {
	render() {
		return (
				<div>
				{this.props.date.toLocaleTimeString()}
				</div>
				);
	}
}
setInterval(tick, 1000);

export default Clock;

function tick() {
// We only want to try to render our component on pages that have a div with an ID
// of "example"; otherwise, we will see an error in our console 
 if (document.getElementById('clock')) {
     ReactDOM.render(
			 <Clock date = {new Date()} />, 
			 document.getElementById('clock'));
     }
}

import React, { Component } from 'react';

class NavbarForm extends Component{
    constructor(props) {
        super(props);
        this.state = {
            email: '',
            password: '',
        };
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChange(event) {
        const name = target.name;
alert("name :"+name);
        /*
        this.setState({
              [name]: value
            });
        this.setState({email: event.target.email});
        this.setState({password: event.target.password})
            */
    }

    handleSubmit(event) {

        alert('A name was submitted: ' + this.state.email + this.state.password);
        event.preventDefault();
    }
    render() {
        return (
            <form onSubmit={this.handleSubmit} className="navbar-form navbar-left">
                <div className="form-group">
                    <input type="text" className="form-control" placeholder="E-Mail Address" name="email" value={this.state.email} onChange={this.handleChange}/>
                    <input type="text" className="form-control" placeholder="Password" name="password" value={this.state.password} onChange={this.handleChange}/>

                </div>
                <button type="submit" className="btn btn-default">Login</button>

            </form>
          );
    }
}

class Navbar extends Component{
    render() {
        return (
        <nav className="navbar navbar-default navbar-static-top">
            <div className="container">
                <div className="navbar-header">

                    <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span className="sr-only">Toggle Navigation</span>
                        <span className="icon-bar"></span>
                        <span className="icon-bar"></span>
                        <span className="icon-bar"></span>
                    </button>

                    <a className="navbar-brand" href={this.props.href}>
                        {this.props.brand}
                    </a>
                </div>
            <NavbarForm />
            </div>
        </nav>
        );
    }
}
export default NavbarForm;
export default Navbar;

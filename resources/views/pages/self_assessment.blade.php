@extends('layouts.app')
@section('content')

    {!! Form::open(['action'=> ['Self_assessmentController@store']]) !!}
    @foreach ($survey->questions as $question)
	<div class="container">
		<div class="jumbotron">
			<div>
            <h1>{{$question->question}}</h1>
			</div>

			<div>
                @foreach ($question->choices as $choice)
					<div class="col-sm-2">
                    {!! Form::radio($question->id,$choice->id)!!} {{$choice->choice}}
					</div>
				@endforeach
			</div>
		</div>
	</div>

@endforeach
<div class="col-sm-12">
    {!! Form::submit('Submit') !!}
</div>
{!! Form::close() !!}
@endsection

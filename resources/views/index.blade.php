@extends('layouts.app')

@section('scripts')
    <script>
        @if(session()->has('token'))
            localStorage.setItem('token_created_by_login', '{{ session('token') }}');
        @endif
    </script>
@endsection

@section('content')
<div class="container">
    <router-view></router-view>

{{--    <index token="{{session()->has('token') ? session('token') : ''}}"></index>--}}
    {{--<index token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJkN2MwZjgxNTcyNDY5OTY1YzlmMzkxMWEwYTk0ZWIxMjNkMWYzNDBiN2E3OTgxMzhiYjc5NGUwODY4NGQ4Njc4NjVhOWIwNTZhZjgxZDJiIn0.eyJhdWQiOiIxIiwianRpIjoiMmQ3YzBmODE1NzI0Njk5NjVjOWYzOTExYTBhOTRlYjEyM2QxZjM0MGI3YTc5ODEzOGJiNzk0ZTA4Njg0ZDg2Nzg2NWE5YjA1NmFmODFkMmIiLCJpYXQiOjE1NTMxODYxNjUsIm5iZiI6MTU1MzE4NjE2NSwiZXhwIjoxNTUzMjcyNTY1LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.U-nZPe9qXquEFg-JLoet-QojNBfkuzGl2g_wSEY0rJQy47A4XY3pE5NxFKnHb4CpJo-IaoAqaARKcVGIsYGMAUkeDZ4W1vgsxBVApLl3SKzxTgiUZgNAu2eKb31boKOHueiQLN7NfqqMGRqUeI0MdMO8eXQQgyUQrdJ7K_lWvm9WxR65yCCsCUZJH6O_0ItygJWiUfXOVS10qjNHxGMNmlfQ1oSlzkYHeMUj_KyJz6dslW70MnzkJt3jbpvX598u2mFsO8oS3kJI8X7sC4l3OtiOFdG3b8BJ-JQoptLy60dR1Gy_firyDqbFdXiyvSC-5AECGxSHgkhPlRH6XEYpcP9aAsG5GQjd8Jlrzm-kf8U5bvO7HEDIhDu6I6pQaHIP4awvcM9Jl1QxLr6Utn2qYRjimueH-dQAtzAa_k145j2oH5WGfF5-kvX6dcXyPjKrbpBNjntQPHkjec_xfq9G0ITiH8Ey1SUfFr_Vgbm8fuQX9P59MwdPVANs2h3hcOedxMYRb-UMRvGBCIj9C9CbFtrla4e62UsXkm_s19Bv7IldKz89qJ_GBmnrnTEte9VTxcEZ1ZxX5XJU1DJzfE3xqd1IB-xy50RKnOIAQUORjGlum8I-Xg9sOcXdk09ICCzIT1ySrEg-ykPFJIKheazBhTnXyuNh1mSVA3dN5kM9bI0"></index>--}}
</div>
@endsection


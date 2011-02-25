# Ruby

## References

* [Reference](http://railsapi.com/doc/rails-v3.0.3_ruby-v1.9.2/)
* [Cheat sheet](http://happygiraffe.net/blog/files/Dojo_Ruby_Handout.pdf)
* text mate bundles and irb

## Defining a class

      class Klass
        @@class_var = "class var"
        attr_accessor :instance_var
        
        def initialize(local_var = "default value")
          @instance_var = local_var
        end
        
        def public_instance_method
          "public instance method"
        end
        
        def self.class_method
          "class method"
        end
        
        def class_var
          @@class_var
        end
      private
        def private_instance_method
          "private instance method"
        end
      end
      

- variables(local/instance/class)
- Constants
- methods (public/private/protected)
- getter/setter

## Reusing code

### Inheritance

    class Base
      def base_method_a
        p "base a"
      end
      
      def base_method_b 
        p "base b"
      end
    end
    
    class SubClass < Base
      def base_method_b
        p "subclass"
        super
      end
    end
    
### Module

    module MyModule
      module  MixIn
        def module_method
         p "module method"
        end
      end
    end
    
    class Included
      include MyModule::MixIn
    end

    class Extended
      extend MyModule::MixIn
    end

- Inheritance
- Module (Mixin/Namespace)
- Delegation


## Hashes/Arrays
    [1,[2,3],4]
    {:a => 1, :b => true, "c" => 'hello'}
    {}.any?
    [].any?

- array
- hash (1.9 allows json style)
- enumerable

## String vs Symbol

    puts "hello world".object_id
    puts "hello world".object_id
    puts :hello.object_id
    puts :hello.object_id

- symbol is often used as a hash key

## Block

    ['foo','bar','baz'].map {|a| a.upcase}

    def block_method &block
     p "some header"
     block.call
     p "some footer"
    end
    
    block_method { p "hello"}


## Reflection
  
    1.methods.grep(/to/)

    1.class
    1.class.superclass.superclass
    1.class.superclass.superclass.superclass

    class Foo
      def initialize
        @foo = 1
      end
    end

    foo = Foo.new
    foo.instance_variables
    foo.instance_variable_get :@foo

## Metaprograming

### validatable_base.rb

- inheritance
- class macro (= class method)
- message passing (send)

### validatable_module.rb

- module
- hook (included) 

### find_by.rb

- module
- method_missing
- instance_variable_get

### Real example (drb.rb)

- part of ruby standard library
- the original was about 200 lines

## Test
#### Test::Unit:

    class UserTest < Test::Unit::TestCase
      def setup
        @user = User.new(:email => "foo")
      end

      def test_email_address_is_nil
        assert_equal("foo", @user.email)
      end
    end

#### [Rspec](http://relishapp.com/rspec)

    describe User do
      before(:each) do
        @user = User.new(:email => "foo")
      end
      it "should have nil email" do
        @user.email.should eq foo"
      end
    end

#### [Shoulda](https://github.com/thoughtbot/shoulda):
    class UserTest < Test::Unit::TestCase
     context "New User" do
      def setup
        @user = User.new(:email => "foo")
      end
      should "have nil email" { assert_equal("foo", @user.email) }
     end
    end

##### [Riot](https://github.com/thumblemonks/riotj):

    context "a new user" do
      setup do
        User.new(:email => "foo")
      end
      asserts("email address") { topic.email == "foo" }
    end


#### [Cucumber](http://cukes.info)
    
    Feature: Addition
      In order to avoid silly mistakes
      As a math idiot 
      I want to be told the sum of two numbers

      Scenario Outline: Add two numbers
        Given I have entered <input_1> into the calculator
        And I have entered <input_2> into the calculator
        When I press <button>
        Then the result should be <output> on the screen

      Examples:
        | input_1 | input_2 | button | output |
        | 20      | 30      | add    | 50     |
        | 2       | 5       | add    | 7      |
        | 0       | 40      | add    | 40     |


- Matcher

    Given /I have entered (\d+) into the calculator/ do |n|
      @calc.push n.to_i
    end

#### Mock/Stub

    user_mock = mock "User"
    user_mock.should_receive(:authenticate).with("password").and_return(true)
    user_mock.should_receive(:coffee).exactly(3).times.and_return(:americano)

    user_mock.should_receive(:coffee).exactly(5).times.and_raise(NotEnoughCoffeeExc
    ption)

    people_stub = mock "people"
    people_stub.stub!(:each).and_yield(mock_user)
    people_stub.stub!(:bad_method).and_raise(RuntimeError)

    user_stub = mock_model("User", :id => 23, :username => "pat", :email => "pat@example.com")

#### Test Data

#### Manual

    default_params = {:url => 'foo', :title => 'bar}
    test_data = MyClass.new(default_params.merge(:subtitle => 'baz'))

##### Fixture

  one:
    url: MyString
    bitly_url: MyString
    title: MyString
    subtitle: MyString
    published_at: 2010-10-26
    summary: MyText
    hatena: 1
    retweet: 1
    private_memo: MyText
    user: 

  two:
    url: MyString
    bitly_url: MyString
    title: MyString
    subtitle: MyString
    published_at: 2010-10-26
    summary: MyText
    hatena: 1
    retweet: 1
    private_memo: MyText
    user: 

##### Factory Girl

    Factory.define :user do |f|
      f.sequence(:email) {|n| "bob#{n}@example.com" }
      f.sequence(:username) {|n| "bob#{n}" }
      f.password "password"
      f.invite_code "dummy_code"
    end


    Factory(:user, :password => nil)
